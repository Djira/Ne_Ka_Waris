class GuessController < ApplicationController
    def guest_admin
        @user = User.find_by(email: "guest_admin@user.com")
        unless @user
            @user = User.create!(name: "guest", email:"guest_admin@user.com", password:"guestpass", password_confirmation:"guestpass", admin: true, guest:true)
        end
        sign_in @user
        redirect_to rails_admin_path
    end

    def guest_user
        @user = User.find_by(email: "guest_user@user.com")
        unless @user
            @user = User.create!(email:"guest_user@user.com", password:"guestpass", admin: false, guest: true)
        end
        sign_in @user
        redirect_to caisses_path
    end

    def show 
        puts "dans le controller le id est: #{current_user.id}"
        @user = User.find(current_user.id)
    end

    def homepage
        if current_user.present?
            redirect_to caisses_path
        end
    end
end
