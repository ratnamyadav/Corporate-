class Api::V1::DealsController < Api::V1::BaseController

  def create
    company = Company.find_by(id: params['deal']['company_id'])

    if company.present?
      deal = company.deals.build(deals_params)
      if deal.save
        render json: {deal: deal.attributes}, status: 200
      else
        render json: {error: 'Failed to save the deal', errors: formatted_error_messages(deal)}, status: 422
      end
    else
      render json: {error: 'Failed to save the deal', errors: {company: 'Invalid company'}}, status: 422
    end
  end

  private
  def deals_params
    params[:date] = params[:created_date]
    params.require(:deal).permit(:date, :no_of_erp_closed, :total_no_of_early_checkout, :total_no_of_erp, :no_of_ms_closed, :total_no_of_ms, :unique_no_of_ms, :no_of_cc_closed, :total_no_of_cc, :unique_no_of_cc, :no_of_wsr_closed, :total_no_of_wsr, :unique_no_of_wsr)
  end
end