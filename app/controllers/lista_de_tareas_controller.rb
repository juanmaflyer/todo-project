class ListaDeTareasController < ApplicationController
  # GET /lista_de_tareas
  # GET /lista_de_tareas.xml
  #before_filter :usuario_autorizado?, :only => [:show] #, :edit, :update, :destroy]
  def index
	@user = current_user
	@lista_de_tareas = current_user.lista_de_tareas

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lista_de_tareas }
    end
  end

  # GET /lista_de_tareas/1
  # GET /lista_de_tareas/1.xml
  def show
    @lista_de_tarea = ListaDeTarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lista_de_tarea }
    end
  end

  # GET /lista_de_tareas/new
  # GET /lista_de_tareas/new.xml
  def new
    @lista_de_tarea = current_user.lista_de_tareas.new
  end

  # GET /lista_de_tareas/1/edit
  def edit
    @lista_de_tarea = ListaDeTarea.find(params[:id])
  end

  # POST /lista_de_tareas
  # POST /lista_de_tareas.xml
  def create
    @lista_de_tarea = current_user.lista_de_tareas.new(params[:lista_de_tarea])

    respond_to do |format|
      if @lista_de_tarea.save
        flash[:notice] = 'La Lista de Tareas fue creada satisfactoriamente'
        format.html { redirect_to(@lista_de_tarea) }
        format.xml  { render :xml => @lista_de_tarea, :status => :created, :location => @lista_de_tarea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lista_de_tarea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lista_de_tareas/1
  # PUT /lista_de_tareas/1.xml
  def update
    @lista_de_tarea = ListaDeTarea.find(params[:id])

    respond_to do |format|
      if @lista_de_tarea.update_attributes(params[:lista_de_tarea])
        flash[:notice] = 'ListaDeTarea was successfully updated.'
        format.html { redirect_to(@lista_de_tarea) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lista_de_tarea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_de_tareas/1
  # DELETE /lista_de_tareas/1.xml
  def destroy
    @lista_de_tarea = ListaDeTarea.find(params[:id])
    @lista_de_tarea.destroy

    respond_to do |format|
      format.html { redirect_to(lista_de_tareas_url) }
      format.xml  { head :ok }
    end
  end
  
  # private
  # def usuario_autorizado?
	# @lista_de_tareas = current_user.lista_de_tareas
	# @ids = []
	# @lista_de_tareas.each do |lt|
		# @ids << lt.id
	# end
	# unless @ids.include?(params[:lista_de_tarea_id])
		# flash[:notice] = "Te esta intentando meter en una lista que no te pertenece!"
	#	redirect_to()
	# end
  # end
  
end
