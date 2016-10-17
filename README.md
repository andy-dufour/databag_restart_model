# databag_restart_model

This is a simple cookbook to demonstrate how you could build a publish/subscribe model for services using databags.

There are a few caveats - by default, clients are unable to update/save databags. You would need to grant them permissions.

I've used two different databags here because they get copied locally onto the TK instance, in reality you'd have a cluster databag, and a databag item per cluster.
