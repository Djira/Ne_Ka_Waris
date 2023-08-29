require 'rails_helper'
RSpec.describe 'Caisse management function', type: :system do

    def user_login
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@user.com'
        fill_in 'user[password]', with: 'userpass'
        click_button 'Se connecter'
      end

    before do
        @user2 = FactoryBot.create(:second_user)
                 FactoryBot.create(:caisse2, user_id: User.last.id)
        @user = FactoryBot.create(:user)
        user_login
        @caiss = FactoryBot.create(:caiss, user_id: User.last.id)
                FactoryBot.create(:need, caiss_id: Caiss.last.id)
                #FactoryBot.create(:need, caiss_id: Caiss.last.id)
                FactoryBot.create(:expense, caiss_id: Caiss.last.id)
        visit caisses_path
    end

    describe 'New caiss creation function' do
        context 'When creating a new caiss' do
          it 'The created caiss is displayed' do
            click_button "Nouveau caiss"
            fill_in 'caiss[start_date]', with: "10/30/2021"
            fill_in 'caiss[end_date]', with: "11/30/2021"
            fill_in 'caiss[amount]', with: "150000"
            #fill_in 'caiss[needs_attributes][name]', with: 'food'
            #fill_in 'need[amount]', with: '52000'
            #select 'Very important', from: 'need[priority]'
            click_on 'Créer caisse'
            expect(page).to have_content 'Votre Caisse a été créé avec succès.'
          end
        end
      end

      describe 'List display function' do
        context 'When transitioning to the list screen' do
          it 'The created caisses list is displayed' do
            visit caisses_path
            expect(page).to have_content '150000'
          end
        end
      end

      describe 'Create expense function' do
        context 'When creating a new expense' do
          it 'The created expense detail is displayed' do
            visit new_expense_path(Caiss.last.id)
            select "Samedi", from: 'expense[day]'
            fill_in 'expense[date]', with: "10/31/2021"
            fill_in 'expense[amount]', with: "10500"
            select "food", from: 'expense[need]'
            fill_in 'expense[description]', with: "J'ai acheté de l'essence"
            click_on "Enregistrer une dépense"
            expect(page).to have_content 'Dépense créée avec succès.'
          end
        end
      end

      describe 'Caisse editing function' do
        context 'When editing a caiss' do
          it 'The new caiss details is displayed' do
            visit edit_caiss_path(Caiss.last.id)
            fill_in 'caiss[start_date]', with: "10/30/2021"
            fill_in 'caiss[end_date]', with: "11/30/2021"
            fill_in 'caiss[amount]', with: "150000"
            #fill_in 'caiss[needs_attributes][name]', with: 'food'
            #fill_in 'need[amount]', with: '52000'
            #select 'Very important', from: 'need[priority]'
            click_on 'Mettre à jour'
            expect(page).to have_content 'caisse a été mis à jour avec succès.'
          end
        end
      end

      describe 'Delete a need function' do
        context 'When deleting a need' do
          it 'The deleted need disapears' do
            visit needs_path
            #delete :destroy, params: {need_route: need_path()}
            click_on "Destroy"
            page.driver.browser.switch_to.alert.accept
            expect(page).not_to have_content 'On going'
          end
        end
      end

      describe 'Create a need function' do
        context 'When creating a need' do
          it 'The  need details are displayed' do
            visit new_need_path
            fill_in 'need[name]', with: "travel"
            fill_in 'need[amount]', with: "10500"
            fill_in 'need[status]', with: "Ras"
            fill_in 'need[caiss_id]', with: Caiss.last.id
            click_on "Create Need"
            expect(page).to have_content 'Need was successfully created.'
          end
        end
      end

      describe 'Edit an expense function' do
        context 'When editing an expense' do
          it 'The new expense details are displayed' do
            visit edit_expense_path(Expense.last.id)
            select "Dimanche", from: 'expense[day]'
            fill_in 'expense[date]', with: "10/31/2021"
            fill_in 'expense[amount]', with: "10500"
            select "food", from: 'expense[need]'
            fill_in 'expense[description]', with: "J'ai acheté de l'essence"
            #fill_in 'expense[caiss_id]', with: Caiss.last.id
            click_on "Mettre à jour cette dépense"
            expect(page).to have_content 'Mis à jour avec succes'
          end
        end
      end

      describe 'Edit a need function' do
        context 'When Edtiting a need' do
          it 'The new need details are displayed' do
            visit edit_need_path(Need.last.id)
            fill_in 'need[name]', with: "Visa"
            fill_in 'need[amount]', with: "10500"
            fill_in 'need[status]', with: "On going"
            fill_in 'need[caiss_id]', with: Caiss.last.id
            click_on "Update Need"
            expect(page).to have_content 'On going'
          end
        end
      end


      describe 'Delete an Expense function' do
        context 'When deleting an expense' do
          it 'The deleted expense disapears' do
            visit caiss_path(Caiss.last.id)
            click_on "Supprimer"
            page.driver.browser.switch_to.alert.accept
            expect(page).to have_content 'Caisses'
          end
        end
      end


      describe 'Delete a caiss function' do
        context 'When deleting a caiss' do
          it 'The deleted caiss disapears' do
            visit caisses_path
            click_on "Supprimer"
            page.driver.browser.switch_to.alert.accept
            expect(page).not_to have_content '150000'
          end
        end
      end


      describe 'User cannot see other users actions' do
        context 'When login' do
          it 'The user can only see his caisses' do
            visit caisses_path
            expect(page).not_to have_content '5327889'
          end
        end
      end

end