module TestBench
  def self.activate
    Assert.activate
    SpecDSL.activate
    Logging.activate
  end

  def self.root
    root!
  end
end
