require('rspec')
require('Vehicle')
require('pry')

describe(Vehicle) do
  before() do
    Vehicle.clear()
    @test_car = Vehicle.new("Subaru", "Outback", 2013)
  end

  describe('#make') do
    it("returns the make of the car") do
      expect(@test_car.make()).to(eq("Subaru"))
    end
  end

  describe('#model') do
    it("returns the model of the car") do
      expect(@test_car.model()).to(eq("Outback"))
    end
  end

  describe('#year') do
    it("returns the year of the car") do
      expect(@test_car.year()).to(eq(2013))
    end
  end

  describe('.all') do
    it("it is empty at first") do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save vehicle to the class variable') do
      @test_car.save()
      expect(Vehicle.all()).to(eq([@test_car]))
    end
  end

  describe('.clear') do
    it("will empty out all of the saved vehicles") do
      @test_car.save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('will find a vehicle by identification number') do
      @test_car.save()
      test_car2 = Vehicle.new("Volvo", "XC70", 2014)
      test_car2.save()
      expect(Vehicle.find(test_car2.id())).to(eq(test_car2))
    end
  end

  describe("#id") do
    it("returns the id of the vehicle") do
      @test_car.save()
      expect(@test_car.id()).to(eq(1))
    end
  end

end
