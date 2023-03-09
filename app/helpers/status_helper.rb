module StatusHelper

  def format_status(status)
    if status == "accepter"
      'acceptée'
    elsif status == "refuser"
      'refusée'
    else
      status
    end
  end
end
