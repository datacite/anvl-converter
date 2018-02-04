class String
  def from_anvl
    hsh = self.split("\n").reduce({}) do |sum, line|
      if line.start_with?("#")
        # ignore
      elsif line.include?(":")
        k, v = line.split(":", 2)
        sum[k.to_s.strip.anvlunesc] = v.to_s.strip.anvlunesc
      elsif line.strip.present? && line.start_with?(" ")
        sum[sum.keys.last] += " " + line.strip
      end

      sum
    end

    # use string or symbol for keys
    HashWithIndifferentAccess.new(hsh)
  end

  def anvlesc
    self.gsub(/%/, "%25").gsub(/\n/, "%0A").gsub(/\r/, "%0D")
  end

  def anvlunesc
    self.gsub(/%25/, "%").gsub(/%0A/, "\n").gsub(/%0D/, "\r").gsub(/%3A/, ":")
  end
end
