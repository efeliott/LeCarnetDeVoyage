class TripsController < ApplicationController
  # Pour effectuer toutes actions CRUD sur un Trip il faut être connecté
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips or /trips.json
  # Affiche tous les voyages
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  # Affiche un voyage en fonction de son id
  def show
    @trip = Trip.find(params[:id])
  end

  # GET /trips/new
  # Gestion des nouveaux voyages
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  # Modification d'un voyage
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips or /trips.json
  # Création d'un voyage
  def create
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  # Modification d'un voyage
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  # Suppression d'un voyage
  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip
      @trip.destroy
      redirect_to trips_path, notice: 'Voyage supprimé avec succès.'
    else
      redirect_to trips_path, alert: 'Voyage introuvable.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find_by(id: params[:id])
      if @trip.nil?
        redirect_to trips_path, alert: "Trip not found."
      end
    end
    

    # Only allow a list of trusted parameters through.
    # Paramètres de base d'un voyage
    def trip_params
      params.require(:trip).permit(:destination, :description, :dateDebut, :dateFin)
    end
end
