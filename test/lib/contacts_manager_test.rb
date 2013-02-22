require 'test_helper'
require 'contacts_manager'

class ContactsManagerTest < ActiveSupport::TestCase
  describe ContactsManager do
    setup do
      @contact = contacts(:dan)
      @params = ActionController::Parameters.new({:contact => {
          :first_name => @contact.first_name,
          :last_name => @contact.last_name
        }
      })
    end

    it 'returns the set of parameters for a contract' do
      expected = {
        "first_name" => @contact.first_name,
        "last_name" => @contact.last_name
      }
      assert_equal ContactsManager.params_permitted(@params), expected
    end

    it 'should persist a contact' do

      assert_equal ContactsManager.persist(@contact), true
    end
  end
end
