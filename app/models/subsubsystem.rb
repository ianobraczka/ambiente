class Subsubsystem < ActiveRecord::Base
    attr_accessible :hh, :name, :current_planning_id, :percentage, :price, :subsystem_id, :total_quantity, :unity, :value, :weight, :image
    has_attached_file :image
    belongs_to :subsystem
    has_many :plannings, :as => :plannable

   

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
        self.plannings.each do |planning|
            pq = pq + planning.planned_quantity
        end
        pq
    end

    def current_planning
        if self.current_planning_id
            Planning.find_by_id(self.current_planning_id)
        end
    end

    def current_period
        current_planning.current_period
    end

    def status_period
        current_planning.status_period
    end

    def weight_variable (weight)
        if weight == 1 then
            mult = self.value
        elsif weight == 2 then
            mult = self.hh
        elsif weight == 3 then
            mult = self.percentage
        end
        mult
    end


end