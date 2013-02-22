require 'test_helper'
require 'contacts_manager'

class ContactsManagerTest < ActiveSupport::TestCase
  describe ContactsManager do
    setup do
      @contact = contacts(:dan)

      contact_params = Hash[*JSON.load(@contact.to_json).map{ |k, v| [k.to_sym, v] }.flatten]

      @params = ActionController::Parameters.new({:contact => contact_params})
    end

    it 'returns the set of parameters for a contract' do
      expected = {
        'first_name' => @contact.first_name,
        'last_name' => @contact.last_name,
        'email' => @contact.email,
        'notes' => @contact.notes
      }
      assert_equal ContactsManager.params_permitted(@params), expected
    end

    it 'should persist a contact' do
      assert_equal ContactsManager.persist(@contact), true
    end
  end
end
