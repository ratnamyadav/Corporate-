class Api::V1::DealsController < Api::V1::BaseController

  def create
    deal = Deal.find_by corporate_finance_id: params['deal']['corporate_finance_id']
    if deal.blank?
      deal = Deal.build(deals_params)
    else
      deal.update deals_params
    end
    if deal.save
      render json: {deal: deal.attributes}, status: 200
    else
      render json: {error: 'Failed to save the deal', errors: formatted_error_messages(deal)}, status: 422
    end
  end

  private
  def deals_params
    params[:deal][:date] = params[:deal][:created_date]
    params.require(:deal).permit(:date, :no_of_erp_closed, :total_no_of_early_checkout, :total_no_of_erp, :no_of_ms_closed, :total_no_of_ms, :unique_no_of_ms, :no_of_cc_closed, :total_no_of_cc, :unique_no_of_cc, :no_of_wsr_closed, :total_no_of_wsr, :unique_no_of_wsr, :corporate_finance_id)
  end
end