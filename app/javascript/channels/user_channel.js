import consumer from "./consumer";

const notifContainer = document.getElementById('notifications');
const notificationsContainer = document.getElementById('navbarDropdownNotif');
if (notificationsContainer) {
  const id = notificationsContainer.dataset.userId;

  consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
    received(data) {
      notifContainer.insertAdjacentHTML('beforeend', data);
      if(document.getElementById("bell-counter") != null) {
        const counterBell = document.getElementById('bell-counter');
        counterBell.innerHTML = parseInt(counterBell.innerHTML) + 1;
      }
      if(document.getElementById("notif-counter") != null) {
        const dashboardCounter = document.getElementById('notif-counter');
        dashboardCounter.innerHTML = parseInt(dashboardCounter.innerHTML + 1);
      }
    },
  });
}
