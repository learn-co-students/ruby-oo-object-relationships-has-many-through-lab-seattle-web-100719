class Patient

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select{|app| app.patient == self}
    end

    def doctors
        arr = []
        Appointment.all.each do |app|
            if app.patient == self
                arr << app.doctor
            end
        end
        arr
    end

end