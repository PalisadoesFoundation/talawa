/// Represents the state of the view
enum ViewState {
  idle,
  busy,
}

enum ChatState { initial, loading, complete }

enum TileType { user, org, option }

enum CallFor { login, signup, joinPublicOrg }

enum ModalSheet { donation, invite }
