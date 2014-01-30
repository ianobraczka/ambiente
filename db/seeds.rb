# #users

# User.delete_all
# User.create! :email => 'jonathan.jgs@gmail.com', :password => 'rootroot', :password_confirmation => 'rootroot'

# #programs

# Program.delete_all

# Program.create! :name => "Prog1", :price => 2
# Program.create! :name => "Prog2", :price => 2

# #enterprises

# Enterprise.delete_all

# Enterprise.create! :name => "Entre1P1", :program_id => Program.first.id
# Enterprise.create! :name => "Entre2P1", :program_id => Program.first.id

# Enterprise.create! :name => "Entre1P2", :program_id => Program.last.id
# Enterprise.create! :name => "Entre2P2", :program_id => Program.last.id

# #areas

# Area.delete_all

# Area.create! :name => "Area1E1P1", :enterprise_id => Program.first.enterprises.first.id
# Area.create! :name => "Area2E1P1", :enterprise_id => Program.first.enterprises.first.id

# Area.create! :name => "Area1E1P2", :enterprise_id => Program.last.enterprises.last.id
# Area.create! :name => "Area2E1P2", :enterprise_id => Program.last.enterprises.last.id

# #systems

# System.delete_all

# System.create! :name => "SystemArea1E1P1", :area_id => Program.first.enterprises.first.areas.first.id
# System.create! :name => "SystemArea2E1P1", :area_id => Program.first.enterprises.first.areas.first.id

# System.create! :name => "SystemArea1E1P2", :area_id => Program.last.enterprises.last.areas.last.id
# System.create! :name => "SystemArea2E1P2", :area_id => Program.last.enterprises.last.areas.last.id

# #subsystems

# Subsystem.delete_all

# Subsystem.create! :name => "SubSystemArea1E1P1", :system_id => Program.first.enterprises.first.areas.first.systems.first.id
# Subsystem.create! :name => "SubSystemArea2E1P1", :system_id => Program.first.enterprises.first.areas.first.systems.first.id

# Subsystem.create! :name => "SubSystemArea1E1P2", :system_id => Program.last.enterprises.last.areas.last.systems.last.id
# Subsystem.create! :name => "SubSystemArea2E1P2", :system_id => Program.last.enterprises.last.areas.last.systems.last.id

# #subsubsystems

# Subsubsystem.delete_all

# Subsubsystem.create! :name => "SubsubSystemArea1E1P1", :subsystem_id => Program.first.enterprises.first.areas.first.systems.first.subsystems.first.id, :current_planing_id => 1
# Subsubsystem.create! :name => "SubsubSystemArea2E1P1", :subsystem_id => Program.first.enterprises.first.areas.first.systems.first.subsystems.first.id, :current_planing_id => 1

# Subsubsystem.create! :name => "SubsubSystemArea1E1P2", :subsystem_id => Program.last.enterprises.last.areas.last.systems.last.subsystems.last.id, :current_planing_id => 1
# Subsubsystem.create! :name => "SubsubSystemArea2E1P2", :subsystem_id => Program.last.enterprises.last.areas.last.systems.last.subsystems.last.id, :current_planing_id => 1