
const clickElementDashboard = () => {

  const allDashboardLine = document.body.querySelector('.dashboard-data-set')
  document.getElementById(allDashboardLine.dataset.line).classList.add('active-dashboard');
}

export { clickElementDashboard };
