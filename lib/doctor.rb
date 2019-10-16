class Doctor

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select{|app| app.doctor == self}
    end

    def patients
        arr = []
        Appointment.all.each do |app|
            if app.doctor == self
                arr << app.patient
            end
        end
        arr
    end

end