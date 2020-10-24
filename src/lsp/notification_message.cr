require "./did_change_text_document_params"
require "./did_close_text_document_params"
require "./did_open_text_document_params"
require "./did_save_text_document_params"

module LSP
  alias NotificationType = (DidChangeTextDocumentParams |
                            DidCloseTextDocumentParams |
                            DidOpenTextDocumentParams |
                            DidSaveTextDocumentParams |
                            VoidParams)?

  struct NotificationMessage
    include JSON::Serializable

    @jsonrpc = "2.0"
    property method : String

    @[JSON::Field(emit_null: true)]
    property params : NotificationType

    def initialize(@method, @params = nil)
    end
  end
end
