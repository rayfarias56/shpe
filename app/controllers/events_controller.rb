class EventsController < ApplicationController
  before_filter :signed_in_user
  before_filter :eboard_user

  # GET /events
  # GET /events.json
  def index
    @events = Event.paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
 
  
  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @name = params[:name]
    @description = params[:description]
    @location = params[:location]
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_registration_path(id: @event.id), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


  def event_choices
    @events = StaticPage.get_events
  end

  def event_registration
    @event = Event.find(params[:id]) if params[:id]
    @event = Event.find(1) unless params[:id]
  end

  def user_attendance
    @event = Event.find(params[:id])
    @users = @event.users
    respond_to do |format|
      format.html # show.html.erb
      format.csv do
        response.headers['Content-Disposition'] = 'attachment; filename="' + @event.name + '.csv"'
      end
    end
  end


  def leaderboard
    @users = User.find_all_by_company(false)
    @points = {}
    for user in @users
      score = 0
      user.events.map { |e| score += e.value }
      @points[user] = score
    end

    @users.sort! {|u1,u2| @points[u2] <=> @points[u1]}
  end
end
