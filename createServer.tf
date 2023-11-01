# Create a server
resource "discord_server" "my_server" {
    name = var.server_name
    region = var.server_region
    default_message_notifications = 0
}

# Get newly created server's ID
data "discord_server" "createdServerInfo" {
    server_id = resource.discord_server.my_server.id
}

resource "discord_category_channel" "general" {
    depends_on = [
      data.discord_server.createdServerInfo
    ]
    name = var.category_name
    position = 0
    server_id = data.discord_server.createdServerInfo.id
}

resource "discord_text_channel" "general" {
    depends_on = [
      resource.discord_category_channel.general
    ]
    name = lower(var.text_channel_name)
    position = 0
    server_id = data.discord_server.createdServerInfo.id
    category = resource.discord_category_channel.general.id
}