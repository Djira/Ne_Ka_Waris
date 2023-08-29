class CaissesController < ApplicationController
  before_action :set_caiss, only: %i[ show edit update destroy summary]
  before_action :authenticate_user!, only: [:new, :create, :index, :edit, :update, :destroy]

  
  def index
   @caisses = Caiss.all
  end

  def show

    if params[:is_resume].present?
      dic_needs_with_amount = {}
      @summary = {}
      @summary_ = {}
      puts "les needs sont: #{@caiss.needs.distinct.pluck(:name, :amount)}, bbb, #{@caiss.expenses.to_json}"
      needs_with_amount = @caiss.needs.distinct.pluck(:name, :amount)

      needs_with_amount.each do |need|
        dic_needs_with_amount[need[0]] = need[1]
      end

      @caiss.expenses.each_with_index do |expense, i|
        #puts " voici caisse de expense: #{expense.amount} "
        #puts "voici expense.need avant #{ @summary}, #{ @summary[expense.need]} et voici "
        if @summary.has_key?(expense.need)

         # puts "voici expense.need #{ @summary}, #{ @summary[expense.need]} et voici #{@summary[expense.need]["used"]}"

          used = @summary[expense.need]["used"] 
          used += expense.amount
          @summary[expense.need]["used"] = used
        else
          puts " voici caiss de expense: #{dic_needs_with_amount} "
          @summary[expense.need] = {"used" => 0, "give" => dic_needs_with_amount[expense.need], "remain" => 0}
          @summary[expense.need]["used"] = expense.amount
          #@summary[expense.need]["give"] = dic_needs_with_amount[expense.need] 
          #@summary[expense.need]["remain"] = dic_needs_with_amount[expense.need]
        end
      end 
      puts " ####### mon dico #{@summary} "  
      @summary.each do |need, val|
        puts "voici need #{need} et voici sa valeur #{val["used"]}"  
      end  
      #raise 
    end
  end

  def new
    @caiss = Caiss.new
    
      
  end

  def edit
    @caiss.needs.build
  end

  def create
    @caiss = Caiss.new(caiss_params)

    respond_to do |format|
     # puts "debut: #{params[:start_date]}, fin: #{params[:end_date]}"
      #raise
      if @caiss.save
        format.html { redirect_to @caiss, notice: "Votre caisse a été créé avec succès." }
        format.json { render :show, status: :created, location: @caiss }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @caiss.update(caiss_params)
        format.html { redirect_to @caiss, notice: "caisse a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @caiss }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @caiss.destroy
    respond_to do |format|
      format.html { redirect_to caisses_url, notice: "La caisse a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    def set_caiss
      @caiss = Caiss.find(params[:id])
    end

    def caiss_params
      params.require(:caiss)
            .permit(:start_date, :end_date, :amount, :name,
                    needs_attributes: [:id, :amount, :name, :priority, :status]
      )
    end
end
