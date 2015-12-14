class NumberGenerator


  attr_reader :key, :offset, :generate_key, :wheels

  def initialize(date = nil, key = nil)
    @offset = generate_offset(date)
    @key = generate_key(key)
    @wheels = []
  end

  def generate_offset(date = nil)
    if date == nil
      today = Time.now.strftime('%d%m%y')
      @offset = parse_date(today)
    else
      @offset = parse_date(date)
    end
  end

  def parse_date(date)
    t1 = date.to_i ** 2
    t1.to_s.chars[-4..-1]
  end

  def generate_key(key)
    if key == nil
      @key = rand(99999).to_s.chars
    else
      @key = key.to_s.chars
    end
  end

  def rotation
    wheels = @wheels
    a = @offset[0].to_i + @key[0..1].join.to_i
    b = @offset[1].to_i + @key[1..2].join.to_i
    c = @offset[2].to_i + @key[2..3].join.to_i
    d = @offset[3].to_i + @key[3..4].join.to_i
    wheels.push(a, b, c, d)
  end
end
