class ApiStub
  def initialize(client)
    @client = client
  end

  def list_projects
    @client.projects.collect(&:to_h)
  end
end
