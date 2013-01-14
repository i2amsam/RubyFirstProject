module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    class Row < Array
      attr_accessor :row_headers

      def method_missing(name, *args, &block)
        self[index_for(name)]
      end

      def index_for(name)
        #puts "Looking for #{name} in #{@row_headers}"
        index = @row_headers.index(name.to_s)
      end
    end

    def read
      @csv_contents = Row.new()
      file = File.new("../resources/ElectionData.csv")
      @headers = file.gets.chomp.split(',')

      file.each do |row|
        newRow = Row.new(row.chomp.split(','))
        newRow.row_headers = @headers
        @csv_contents << newRow
      end
    end

    def each(&block)
      @csv_contents.each &block
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end


end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts "Now testing each:"
m.each { |row| puts row.Party }