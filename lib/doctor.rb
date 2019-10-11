class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end.map do |appointment|
            appointment.patient
        end
    end

    def self.all
        @@all
    end
end