class Const
    def self.get_time; @@my_time; end
    @@my_time = Time.now.to_i
end