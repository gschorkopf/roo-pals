class NullSchedule
  def attending?(show)
    false
  end

  def not_uploaded?
    true
  end

  def decorate
    self
  end
end
