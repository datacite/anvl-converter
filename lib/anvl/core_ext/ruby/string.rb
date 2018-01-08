class String
  def from_anvl
    hsh = self.split("\n").reduce({}) do |sum, line|
      if line.start_with?("#")
        # ignore
      elsif line.include?(":")
        k, v = line.split(":", 2)
        sum[k.to_s.strip.kanvlunesc] = v.to_s.strip.anvlunesc
      elsif line.start_with?(" ")
        sum[sum.keys.last] += " " + line.strip
      end

      sum
    end

    # use string or symbol for keys
    HashWithIndifferentAccess.new(hsh)
  end

  def kanvlesc
    self.anvlesc.gsub(/:/, "%3A")
  end

  def anvlesc
    self.gsub(/%/, "%25").gsub(/\n/, "%0A").gsub(/\r/, "%0D")
  end

  def kanvlunesc
    self.gsub(/%3A/, ":").anvlunesc
  end

  def anvlunesc
    self.gsub(/%25/, "%").gsub(/%0A/, "\n").gsub(/%0D/, "\r")
  end
end
