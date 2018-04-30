module Owner
  class ManagerRequestService < BaseService
    def index(restaurant, params)
      manager_requests = restaurant.manager_requests.where(state: params[:state] || 'pending').page(params[:page] || 1)
      [manager_requests, :ok]
    end

    def create(restaurant, params)
      manager_request = restaurant.manager_requests.new(params)
      message = simple_create(manager_request, options)
      render_message(message)
    end

    def approve(manager_request)
      return render_state_error unless manager_request.may_approve?
      manager_request.approve!
      [{ notice: I18n.t('manager_requests.state.approve') }, :ok]
    end

    def repending(manager_request)
      return render_state_error unless manager_request.may_repending?
      manager_request.repending!
      [{ notice: I18n.t('manager_requests.state.repending') }, :ok]
    end

    def reject(manager_request, comment_params)
      return render_state_error unless manager_request.may_reject?
      manager_request.comment = comment_params[:comment]

      return [{ notice: I18n.t('manager_requests.state.reject') }, :ok] if manager_request.reject!
      [{ message: manager_request.errors.full_messages.first }, :unprocessable_entity]
    end

    def retire(manager_request, comment_params)
      return render_state_error unless manager_request.may_retire?
      manager_request.comment = comment_params[:comment]

      return [{ notice: I18n.t('manager_requests.state.retire') }, :ok] if manager_request.retire!
      [{ message: manager_request.errors.full_messages.first }, :unprocessable_entity]
    end

    private

    def render_state_error
      [{ message: I18n.t('manager_requests.state.error') }, :unprocessable_entity]
    end
  end
end
