class TenantsController < ApplicationController
  def create
    tenant = Tenant.create!(tenant_params)
    render json: tenant, status: :created
  end

  def index
    render json: Tenant.all
  end

  def update
    tenant = Tenant.find(params[:id])
    tenant.update!(tenant_params)
    render json: tenant, status: :ok
  end

  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    head :no_content
  end

  private

  def tenant_params
    params.permit(:id, :name, :age)
  end
end
