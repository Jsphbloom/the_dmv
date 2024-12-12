

class Registrant

    attr_reader :name,
                :age,
                :permit,
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
    end

    def permit?
        if @permit?
            return true
        end
    end
end
###