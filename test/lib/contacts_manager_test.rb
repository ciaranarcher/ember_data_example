require 'test_helper'
require 'contacts_manager'

class ContactsManagerTest < ActiveSupport::TestCase
  describe ContactsManager do
    setup do
      @contact = contacts(:dan)
    end

    it "should persist a contact" do
      assert_equal ContactsManager.persist_contact(@contact), true
    end
  end
end
