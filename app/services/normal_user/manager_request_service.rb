module NormalUser
  class ManagerRequestService < BaseService
    def index(page)
      manager_requests = current_user.manager_requests.page(page || 1)
      [manager_requests, :ok]
    end

    def approve(manager_request)
      return render_state_error unless manager_request.may_approve?
      manager_request.approve!
      [{ notice: I18n.t('manager_requests.state.approve') }, :ok]
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
