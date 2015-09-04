describe DockingStation do
	it { is_expected.to respond_to :release_bike }

	it 'releases bikes if working' do
		subject.dock Bike.new
		subject.release_bike
		expect(bike).to be_working
	end

	it {is_expected.to respond_to(:dock).with(1).argument}

	describe 'release_bike' do
		it 'raises an error message when no bikes are available' do
			expect { subject.release_bike }.to raise_error 'No bikes available'
		end
	end
end