class CompaniesController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    respond_to do |format|
    format.js
    end
  end

  def show
    @claims = Claim.all.order('created_at DESC')
   end

  def destroy
    @company.destroy
    respond_to do |format|
    format.js
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
        format.js {}

      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end

end
