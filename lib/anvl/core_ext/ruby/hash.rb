class Hash
  def to_anvl
    lines = self.map { |k, v| [k.to_s.anvlesc, v.to_s.anvlesc].join(": ") }
    lines.join("\n").force_encoding(Encoding::UTF_8)
  end
end
