class Alert < ActiveRecord::Base
  belongs_to :patient

  def display_notes
      notes.gsub(/\n/, '<br>')
  end

end
