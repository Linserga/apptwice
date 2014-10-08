require 'rails_helper'

describe UserSession do

	let(:request){ double('Request')}
	let(:user){ double("User", id: 1)}
	let(:finder){double('User')}

	it 'can start a session' do
		allow(request).to receive(:session).and_return({})
		# allow(user).to receive(:id).and_return 1

		user_session = UserSession.new(request, finder)
		user_session.start_session(user)

		expect(request.session[:user_id]).to eq 1
	end

	it 'can destroy session' do
		allow(request).to receive(:session).and_return({user_id: 1})
		# allow(user).to receive(:id).and_return 1
		
		user_session = UserSession.new(request, finder)
		user_session.destroy_session

		expect(request.session[:user_id]).to eq nil
	end

	it 'can determine current user' do
		allow(request).to receive(:session).and_return({user_id: 1})
		allow(finder).to receive(:where).and_return finder
		allow(finder).to receive(:first).and_return user

		user_session = UserSession.new(request, finder)

		expect(user_session.current_user).to eql user

		user_session.destroy_session
		expect(user_session.current_user).to eql nil
	end
end