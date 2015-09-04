require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to(:release_bike) }

	it 'should only release working bikes' do
		bike = double :bike, broken?: false
	  subject.dock bike
	  expect(subject.release_bike).to be bike
	end

	it { is_expected.to respond_to(:dock).with(1).argument }

	it 'raises an error when there are no bikes available' do
		expect { subject.release_bike }.to raise_error 'No bikes available'
	end

	it 'raise error message when full' do
		subject.capacity.times { subject.dock :bike }
		expect { subject.dock :bike }.to raise_error 'Docking station is full'
	end

	it 'has a default capacity' do
	expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end
end
