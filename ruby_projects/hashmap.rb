class HashMap
  attr_accessor :load_factor, :capacity, :hashmap

  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity)
  end

  def get_bucket_index(key)
    hash(key) % @capacity
  end

  def hashmap_length
    count = 0
    @buckets.each do |bucket|
      if bucket.nil?
        next
      else
        count += 1
      end
    end  
    count
  end

  def overcrowded?
    max_load = @capacity * @load_factor
    load = hashmap_length
    return true if load > max_load
    false
  end

  def hashmap_expand
    @capacity += 1
    @buckets.push(nil)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    bucket_index = get_bucket_index(key)
    if @buckets[bucket_index] != nil && overcrowded? == false
      puts "Old value: #{@buckets[bucket_index]}"
      @buckets[bucket_index] = value
      puts "New value: #{@buckets[bucket_index]}"
      puts @buckets
    elsif @buckets[bucket_index] != nil && overcrowded? == true
      puts "Old value: #{@buckets[bucket_index]}"
      hashmap_expand
      bucket_index = get_bucket_index(key)
      @buckets[bucket_index] = value
      puts @buckets
    else
      @buckets[bucket_index] = value
      puts @buckets
    end
  end

  def get(key)
    @buckets["#{hash(key)}"]
  end

  def has?(key)
    @buckets.key?("#{hash(key)}")
  end

end