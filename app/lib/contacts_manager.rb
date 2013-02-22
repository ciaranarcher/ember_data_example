class ContactsManager
  def self.persist(contact)
    true
  end

  def self.params_permitted(params)
    params.require(:contact).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :notes,
                                    phone_numbers: [:id, :number])
  end
end