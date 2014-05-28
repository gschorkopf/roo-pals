class Issue
  attr_reader :issue_factory, :title, :details, :user, :label

  def initialize(params)
    @title = params[:title]
    @details = params[:details]
    @label = assign_label(params[:label])
    @user = params[:user]
    @issue_factory = Github::Issues
  end

  def upload
    issue_factory.new(
      basic_auth: basic_auth,
      repo: 'roo-pals',
      user: 'gschorkopf'
    ).create(
      body: body,
      labels: label
    )
  end

  def self.label_options
    LABEL_PAIRS.keys.map { |label| [label.capitalize, label] }
  end

  private

  def body
    "#{user.full_name} (#{user.email}): #{details}"
  end

  def assign_label(label)
    LABEL_PAIRS[label]
  end

  LABEL_PAIRS = {
    'bug' => ['bug'],
    'feature' => ['enhancement']
  }

  def basic_auth
    ENV['GITHUB_BASIC_AUTH']
  end
end
