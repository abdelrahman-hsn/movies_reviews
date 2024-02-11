class Director < User
  after_initialize :set_type

  private

  def set_type
    self.type = "Director" if new_record?
  end
end
