class Subsubsystem < ActiveRecord::Base
    attr_accessible :hh, :name, :current_planning_id, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value, :weight, :image
    has_attached_file :image
    belongs_to :subsystem
    has_many :plannings, :as => :plannable

    def resumo
        cpp = current_planning

        cp = cpp.periods

        cp.each do |c|

            if c.replanned
                print "s"
            else
                print "n"
            end

            print " - "
            print c.value_planned
            print " - "
            puts c.value_real
            
        end
    end

    def financeiro
        v = v2 = 0
        current_planning.periods.each do |period|
            v += period.value_planned
            if period.value_real
                v2 += period.value_real
            end
        end
        r = Hash.new

        r["value_planned"] = v
        r["value_real"] = v2

        r
    end

    def avanco_fisico_ponderado
        unless current_planning
            return 
        end

        retorno = []

        prev_period = []
        prev_ate_periodo = []
        real_periodo = []
        real_ate_periodo = []
        current_planning.periods.each do |period|

            if period.quantity

                a = period.planned_quantity*100/planned_quantity

                b = value * 100 / system_value
                c = percentage * 100 / system_percentage
                d = hh * 100 / system_hh

                prev_period = [(a*b/100), (a*c/100), (a*d/100)]
                if period.quantity
                    a = period.quantity * 100 / planned_quantity
                else
                    a = 0
                end

                c = percentage * 100 / system_percentage
                d = hh * 100 / system_hh

                real_periodo = [(a*b/100), (a*c/100), (a*d/100)]

                a = (period.planned_until_period/planned_quantity)*100
                c = percentage * 100 / system_percentage
                d = hh * 100 / system_hh

                prev_ate_periodo = [(a*b/100), (a*c/100), (a*d/100)]

                a = period.made_until_period/planned_quantity
                c = percentage * 100 / system_percentage
                d = hh * 100 / system_hh

                real_ate_periodo = [(a*b/100), (a*c/100), (a*d/100)]

                retorno << [prev_period, prev_ate_periodo, real_periodo, real_ate_periodo]
            end
        end


        return retorno
    end

    def system_value
        System.find(Subsystem.find(subsystem_id).system_id).value * 1.0
    end

    def system_hh
        System.find(Subsystem.find(subsystem_id).system_id).hh * 1.0
    end

    def system_percentage
        System.find(Subsystem.find(subsystem_id).system_id).percentage * 1.0
    end

    def all_plannings
        all = []

        self.plannings.each do |planning|
            all << [planning.input_date, "#{planning.id}"]
        end

        all
    end

    def real_quantity
        self.plannings.empty? ? 0 : self.plannings.map(&:real_quantity).sum
    end

    def completed
        if self.real_quantity == nil or self.planned_quantity == 0 then
            return 0
        end

        ((self.real_quantity/self.planned_quantity)*100).round
    end

    def planned_quantity
        pq = 0
        if self.plannings
            self.plannings.each do |planning|
                pq = pq + planning.planned_quantity
            end
        end
        pq
    end

    def current_planning
        return Planning.find_by_id(self.current_planning_id) if self.current_planning_id

        nil
    end

    def current_period
        current_planning.current_period
    end

    def status_period
        current_planning.status_period
    end

    def weight_variable (weight)
        if weight == 0 then
          mult = self.value
      elsif weight == 2 or weight == 3 then
          mult = self.hh
      elsif weight == 1 then
          mult = self.percentage
      end
      mult
  end
end