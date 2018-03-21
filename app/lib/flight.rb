class Flight
  def self.get_starting_ending(paths)
    airports = paths.flatten
    occurrences = Hash[*airports.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.sort_by{|k,v| v}.flatten]    
    if occurrences.values[0] == 1 && occurrences.values[1] == 1
      airport1 = occurrences.keys[0]
      airport2 = occurrences.keys[1]
    
      if airports.index(airport1) % 2 == 0 
        starting_airport = airport1
        ending_airport = airport2
      else
        starting_airport = airport2
        ending_airport = airport1
      end
      ordered_paths = []
      
      src = starting_airport
      
      loop do 
        dest = airports[airports.index(src)+1]
        ordered_paths << [src, dest]
        break if dest == ending_airport
        src = airports[airports.each_index.find{|i| airports[i] == dest && i.even? }]
      end            
      return {
        airport_code: [starting_airport, ending_airport],
        ordered_paths: ordered_paths
      }
    end    
  rescue
    return {}  
  end
end