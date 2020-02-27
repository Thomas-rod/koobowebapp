import consumer from "./consumer";

const notifContainer = document.getElementById('notifications');
const notificationsContainer = document.getElementById('navbarDropdownNotif');
if (notificationsContainer) {
  const id = notificationsContainer.dataset.userId;

  consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
    received(data) {
      notifContainer.insertAdjacentHTML('beforeend', data);
    },
  });
}
