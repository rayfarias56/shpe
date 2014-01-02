require 'google/api_client'


class StaticPage


  def self.get_events
    oauth_yaml = YAML.load_file(OAUTH_YAML_PATH)

    client = Google::APIClient.new({:application_name => "SHPE Website", :application_version => "1.0"})
    client.authorization.client_id = oauth_yaml["client_id"]
    client.authorization.client_secret = oauth_yaml["client_secret"]
    client.authorization.scope = oauth_yaml["scope"]
    client.authorization.refresh_token = oauth_yaml["refresh_token"]
    client.authorization.access_token = oauth_yaml["access_token"]

    if client.authorization.refresh_token && client.authorization.expired?
      client.authorization.fetch_access_token!
    end

    service = client.discovered_api('calendar', 'v3')

    page_token = nil
    result = client.execute(:api_method => service.events.list,
                            :parameters => {'calendarId' => 'f43nbgbtslbe9jou3920okesh0@group.calendar.google.com',
                                            'singleEvents' => 'true',
                                            'orderBy' => 'startTime',
                                            'timeMin' => Time.now.utc.iso8601})
    all_events = []
    loop do
      events = result.data.items
      events.each do |e|
        all_events << e
      end
      #Only used if there are multiple pages of results.
      if !(page_token = result.data.next_page_token)
        break
      end
      result = client.execute(:api_method => service.events.list,
                              :parameters => {'calendarId' => 'f43nbgbtslbe9jou3920okesh0@group.calendar.google.com',
                                              'singleEvents' => 'true',
                                              'orderBy' => 'startTime',
                                              'timeMin' => Time.now.utc.iso8601,
                                              'pageToken' => page_token})
    end

    all_events



  end
end



