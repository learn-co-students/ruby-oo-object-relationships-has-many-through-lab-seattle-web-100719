class Patient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        Appointment.all.select do |appointment|
            appointment.patient == self
        end.map do |appointment|
            appointment.doctor
        end
    end

    def self.all
        @@all
    end
end