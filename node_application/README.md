### Notes

Different between CMD and RUN in Dockerfile


> ``` RUN - It comes into picture when image is getting created ```
>
> ``` CMD - It comes into picture when container is getting started ```

An additional note

> For all docker commands where an ID can be used, we don't always have to copy / write out the full id.
>
> We can also just use the first (few) character(s) - just enough to have a unique identifier.
>
> So instead of
>
> ```docker run abcdefg```
>
> we could also run
>
> ```docker run abc```
>
> or, if there's no other image ID starting with "a", we could even run just:
>
> ```docker run a```
>
> This applies to ALL Docker commands where ID's can be used
>

