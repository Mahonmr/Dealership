require('rspec')
require('dealership')

describe(Dealership) do
  before() do
    Dealership.clear()
    @test_dealership = Dealership.new("Bob Lanphere")
  end


  describe('#name') do
    it("returns the name of the dealership") do
      expect(@test_dealership.name()).to(eq("Bob Lanphere"))
    end
  end

  describe('#id') do
    it("returns the id of the dealership") do
      expect(@test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("starts with an empty array of cars for the dealership") do
      expect(@test_dealership.cars()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a dealership to the array of saved dealerships") do
      @test_dealership.save()
      expect(Dealership.all()).to(eq([@test_dealership]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties out the saved dealerships') do
      @test_dealership.save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a dealership by its id number') do
      @test_dealership.save()
      test_dealership2 = Dealership.new("Seaport Auto")
      test_dealership2.save()
      expect(Dealership.find(test_dealership2.id())).to(eq(test_dealership2))
    end
  end
end
