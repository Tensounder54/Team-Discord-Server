resource "discord_invite" "inviteMe" {
    channel_id = resource.discord_text_channel.general.id
    max_age = 0
}

output "invite_info" {
    value = resource.discord_invite.inviteMe.id
}