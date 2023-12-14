# add users to sudoers with visudo
cd /etc/sudoers.d
echo "%Domain\ Admins@company.local ALL=(ALL) NOPASSWD: ALL" > cdh-domain-admins
echo "${app_support_admin}@company.local ALL=(ALL) NOPASSWD: ALL" > cdh-${app_env}-app-support-admins
echo "${app_users}@company.local ALL=(ALL) NOPASSWD: ALL" > cdh-${app_env}-finstack-apps-users
echo "${app_admins}@company.local ALL=(ALL) NOPASSWD: ALL" > cdh-${app_env}-finstack-apps-admins
chmod 0440 cdh-${app_env}-app-support-admins cdh-domain-admins cdh-${app_env}-finstack-apps-users cdh-${app_env}-finstack-apps-admins
 
## Allow users to perform sudo
echo "Performing sudo permission changes.."
cd /etc
if ! grep -q "%Domain\\\\ Admins@company.local ALL=(ALL) NOPASSWD: ALL" sudoers
then
    echo "## Allow users to perform sudo" >> sudoers
    echo "%Domain\ Admins@company.local ALL=(ALL) NOPASSWD: ALL" >> sudoers
    echo "%Domain\ Admins@company.local ALL=(ALL) NOPASSWD: ALL added to sudoers!"
else
    echo " AD group %Domain\ Admins@company.local ALL=(ALL) NOPASSWD: ALL already exist in sudoers!"
fi
if ! grep -q "${app_support_admin}@company.local ALL=(ALL) NOPASSWD: ALL" sudoers
then
    echo "${app_support_admin}@company.local ALL=(ALL) NOPASSWD: ALL" >> sudoers
    echo "${app_support_admin}@company.local ALL=(ALL) NOPASSWD: ALL added to sudoers!"
else
    echo " AD group ${app_support_admin}@company.local ALL=(ALL) NOPASSWD: ALL already exist in sudoers!"
fi
if ! grep -q "${app_admins}@company.local ALL=(ALL) NOPASSWD: ALL" sudoers
then
    echo "${app_admins}@company.local ALL=(ALL) NOPASSWD: ALL" >> sudoers
    echo "${app_admins}@company.local ALL=(ALL) NOPASSWD: ALL added to sudoers!"
else
    echo " AD group ${app_admins}@company.local ALL=(ALL) NOPASSWD: ALL already exist in sudoers!"
fi
if ! grep -q "${env_name}-finstack-svc@company.local ALL=(ALL) NOPASSWD: ALL" sudoers
then
    echo "${env_name}-finstack-svc@company.local ALL=(ALL) NOPASSWD: ALL" >> sudoers
    echo "${env_name}-finstack-svc@company.local ALL=(ALL) NOPASSWD: ALL added to sudoers!"
else
    echo " AD group ${env_name}-finstack-svc@company.local ALL=(ALL) NOPASSWD: ALL already exist in sudoers!"
fi
