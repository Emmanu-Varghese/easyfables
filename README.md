<p>This is a story competition web app.The basic working is Admins can create contests and users can write stories and participate in that competition. Users can like and comment on stories.Project uses Rails 6 and sqlite as db. We will use Postgresql once we have minimum valuable product.</p>
<ul>
<li>Clone the repo</li>
  <li><code>bundle install</code></li>
<li><code>rails db:create</code></li>
<li><code>rails db:migrate</code></li>
<li><code>rails s</code></li>
</ul
<p>signup here http://0.0.0.0:3000/users/sign_up .. Then confirm your email.</p>

In rails console,
<ul>
  <li><code>user = User.find(1)</code></li>
<li><code>user.add_role(:admin)</code></li>
</ul>
Now this user has admin role and can access evrything
