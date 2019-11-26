class Profile::Evolution
  @started = nil
  @novice = nil
  @knight = nil

  def initialize(user)
    @user = user
    @started = Profile::Evolution::Started.new(@user)
    @novice = Profile::Evolution::Novice.new(@user)
    @knight = Profile::Evolution::Knight.new(@user)
  end

  def run
    born_to_started
    evolve_into_novice if @started.level_up?
    evolve_into_knight if @novice.level_up?
  end

  private

  def born_to_started
    @started.run
  end

  def evolve_into_novice
    @novice.run
  end

  def evolve_into_knight
    @knight.run
  end

end
